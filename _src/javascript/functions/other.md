# 其他未被归类的功能

## 扩展 jQuery hashchange 插件

    /**
     * @author Zem Zheng (zemzheng@gmail.com)
     * @desciption Extension for hashchange event, baseon jQuery. 
     * <pre>
     *   // you can import <jq.hashchangefix.js> here
     *   // https://gist.github.com/zemzheng/8574216
     *   
     *   //Useage:
     *   $( window ).on(
     *       'hashchange::all' || 'hashchange::path' || 'hashchange::param',
     *       function(e, path, params, hash){ 
     *          // your code here 
     *       }
     *   );
     *
     *   $.zHashExtension.getData()            // current hash data
     *   $.zHashExtension.getData( isOld = 1 ) // last hash data
     *   $.zHashExtension.setHash(
     *      {
     *          path : 'path/'
     *          data :
     *      }
     *   )
     *
     *   
     *   Effect when hash change:
     *    Name
     *      #<path>#<params>
     *      * <params> = <key>=<val>&<key2>=<val2>...
     *      RegExp : # [^#]+ #{0,1} ( [^=&]+=[^=&]+&{0,1} )*
     *   
     *    Events:
     *      hashchange::path 
     *          #<path>#<params>  ==> #<path2>#<params>
     *      hashchange::param
     *          #<path>#<params>  ==> #<path>#<params2>
     *   
     *    Example:
     *        #Hello#a=1
     *        #Hello/Zem#a=1&b=2&c=3
     *        #Hey/Zem#code=100
     * </pre>
     */
    (function( $ ){
        var jQ_Namespace = 'zHashExtension',
            Evt_prefix   = 'hashchange::';

        var $win = $( window ),
            decodeUrl = decodeURIComponent,
            encodeUrl = encodeURIComponent,

            /* ==>
             * [ 
             *    'hashchange::path', 
             *    'hashchange::param', 
             *    'hashchange::all'
             * ]
             */
            _EventsMap = '%spath,%sparam,%sall'
                .replace( /%s/g, Evt_prefix )
                .split( ',' ),
            
            globalHashchange = 'hashchange.' + jQ_Namespace,

            _setHash = function( opts ){
                if( !( opts.path || opts.data ) ) return false;
                var path = opts.path || _now_hashdata[ 0 ],
                    params = [],
                    key,
                    data = ( path === _now_hashdata[ 0 ] ) 
                                // 路径不变，按设置覆盖
                                ? $.extend( {}, _now_hashdata[ 1 ], opts.data ) 
                                // 路径变化，全部启用新的路径
                                : opts.data,
                    result;

                for( key in data ){
                    params.push(
                        encodeUrl( key ) + '=' + encodeUrl( data[ key ] )
                    );
                }

                result = '#' + path + '#' + params.join( '&' );

                // 下面这样写为了马上生效，但是导致 hash 失效
                // _old_hashdata = _now_hashdata;
                // _now_hashdata =_adaper( result );
                // 下面设置hash之后触发了事件，等于两次触发同一个新hash
                return location.hash = result;
            },

            _getData = function( old ){
                return old ? _old_hashdata : _now_hashdata; 
            },

            _offAll = function(){
                var ii = _EventsMap.length;
                while( ii-- ){
                    $win.off( _EventsMap[ ii ] );
                }
            },

            _adaper = function( hash ){
     
                var val  = {},
                    path = hash
                            .replace(/^#[\/]*/,'')
                            .replace(/\/*#(.+)$/ /**/,function( m, str ){
                                str.replace(/([^&]+)=([^&]+)/g, function(m, k, v){
                                    val[ decodeUrl( k ) ] = decodeUrl( v );
                                });
                                return '';
                            })
                            .replace( /#$/, '' );
                return [ path, val, hash ];
            },
            isEqual = function( a, b ){
                if( 'string' === typeof a ) return a === b;
                var key;
                for( key in a ){                
                    if( !b || !isEqual( a[key], b[key]) ) return 0;
                }
                return 1;
            },
            _old_hashdata,
            _now_hashdata = _adaper( location.hash );
     
        var specialHash = {},
            runSpecialHandle = function( hash, type ){
                var hash_str = hash[ type ] && hash[ type ][ 2 ],
                    hash_obj = specialHash[ hash_str ],
                    handle   = hash_obj && hash_obj[ type ];
                return ( 'function' === typeof handle ) && handle();
            };
        $win.off( globalHashchange ).on( globalHashchange, function( e ){
            var hash = {
                    to   : _adaper( location.hash ),
                    from : _now_hashdata
                };
            if( ( runSpecialHandle( hash, 'from' ) ) ) return;
            if( ( runSpecialHandle( hash, 'to'   ) ) ) return;

            if( false === ( ( 'function' === typeof _.hook_beforeAll ) && _.hook_beforeAll( hash ) ) ) return;

            var tmp      = _old_hashdata = _now_hashdata,
                hashdata = _now_hashdata = hash.to;
     
            var i = 0,
                ii = _EventsMap.length,// - 1,
                trigger = function(){ $win.trigger( _EventsMap[ i ], hashdata ) };
            while( i < ii ){
                isEqual( hashdata[ i ], tmp[ i ] ) || trigger();
                i++;
            }
            ( 'function' === typeof _.hook_afterAll ) && _.hook_afterAll( hash );
            // trigger();
        } );
        // 其实没有必要触发，在这之前应该还没有绑定事件?
        //.trigger( globalHashchange );

        var _ = $[ jQ_Namespace ] = {
            reset   : function(){
                _old_hashdata = _now_hashdata = '';
                $win.trigger( globalHashchange );
            },
            setHash : _setHash,
            getData : _getData,
            getHash : _getData,
            offAll  : _offAll,
            setSpecial : function( data ){
                $.extend( specialHash, data );
            }
        };
    })( jQuery );
