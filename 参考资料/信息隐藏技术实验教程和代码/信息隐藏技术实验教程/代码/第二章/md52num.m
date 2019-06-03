%hashreplaceme的子函数用以将MD5码转成数字
function result=md52num(md5code)
result=0;
for i=1:32
    result=result+table(md5code(i))*i;
end

