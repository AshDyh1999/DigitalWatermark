%hashreplaceme���Ӻ������Խ�MD5��ת������
function result=md52num(md5code)
result=0;
for i=1:32
    result=result+table(md5code(i))*i;
end

