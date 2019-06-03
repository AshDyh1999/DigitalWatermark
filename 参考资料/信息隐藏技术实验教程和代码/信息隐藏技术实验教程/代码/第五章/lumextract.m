%�ļ���:lumextract.m
%����Ա:����
%��дʱ��:2004.2.25
%��������:��������������ȿռ��µ�������Ϣ����ȡ.
%�����ʽ����:result=lumextract('c:\lenna.jpg','c:\test.png','c:\extract.txt',128,1983)
%����˵��:
%coverΪԭʼ����ͼ��
%stegocoverΪ��������Ϣ��������Ϣ
%goalfileΪ��Ϣ��ȡ�󱣴�ĵ�ַ
%key1Ϊ������Ϣ��bit��,��Ϊһ����Կ�������
%key2Ϊ��ȡ��Կ
%resultΪ��ȡ����Ϣ
function result=lumextract(cover,stegocover,goalfile,key1,key2)
%��ȡԭʼ����ͼ����Ϣ,����ȡ���ȷ���
originalimage=imread(cover);
originalimage=double(originalimage)/255;
originalYUV=rgb2ycbcr(originalimage);
originalbright=originalYUV(:,:,1);
%��ȡ��������ͼ����Ϣ,����ȡ���ȷ���.������ӦΪ16λ�洢��ʽ��ͼ��,����ʹ��png��ʽ
stegoimage= imread(stegocover);
stegoimage=double(stegoimage)/65535;
stegoYUV=rgb2ycbcr(stegoimage);
stegobright=stegoYUV(:,:,1);
%����α����������,ȷ����Ϣ����λ
[row,col]=randinterval(stegobright,key1,key2);
%׼����ȡ����д��Ϣ
frr=fopen(goalfile,'a');%�����ļ�ָ��
for i=1:key1
    if  originalbright(row(i),col(i))>stegobright(row(i),col(i))
        fwrite(frr,0,'bit1');%��д0
        result(i,1)=0;    
    else
        fwrite(frr,1,'bit1');%��д1
        result(i,1)=1;
    end
end
fclose(frr);

    