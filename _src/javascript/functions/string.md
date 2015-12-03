# Javascript - Function - String

## 数字千分位逗号

    function ( s, len ){
    
        s = (function( len ){ 
                return ~~( s * len ) / len + ''
        })( Math.pow( 10, len = len || 2 ) );

        s = s.split( '.' );
        if( s.length < 2 ) s.push( '' );
        while( s[1].length < len ) s[1] += '0';

        var re = /(\d)(\d{3}[\.,])/;
        s[0] += '.';
        while( re.test( s[0] ) ) s[0] = s[0].replace( re, "$1,$2" );

        return s.join( '' );
    }

## 时间格式化

    function( time, format ){
        format = format || '%Y 年 %m 月 %d 日';
        var d = new Date( time * 1000 );
        return format
            .replace( /%Y/g, d.getFullYear()  )
            .replace( /%m/g, d.getMonth() + 1 )
            .replace( /%d/g, d.getDate()      )
            .replace( /%H/g, d.getHours()     )
            .replace( /%i/g, d.getMinutes()   )
            .replace( /%s/g, d.getSeconds()   )
    }

## 字符串补全

    function( str, len, fill ){
        fill = fill || 0;
        while( str.length < len ){
            str = fill + str;
        }
        return str;
    }
