# image

## image 转 data-url

    # 浏览器
    function image2dataurl( img ){
        var c = document.createElement("canvas");
        c.width  = img.width;
        c.height = img.height;
        c.getContext("2d").drawImage( img, 0, 0 );
        return c.toDataURL();
    };

    # 使用方法
    var dataurl = image2dataurl( img );

## url 转 data-url

    # 浏览器
    # 调用本页的 image2dataurl 方法
    function url2dataurl( url ){
        return new Promise( function( resolve, reject ){
            var i = new Image();
            i.onload = function(){
                resolve( image2dataurl( i ) );
            };
            i.onerror = function( e ){
                reject( e );
            }
            i.src = url;
        } );
    };

    # 使用方法
    var dataurl;
    url2dataurl( 'http://to-your-image' ).then(function( _dataurl ){
        dataurl = _dataurl;
    });
