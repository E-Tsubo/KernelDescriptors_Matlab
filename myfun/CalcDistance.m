addpath('../myfun/');
variance;

%Color
Nc = 15;
Color = colormap(colorcube(Nc));

%“]’u Todo...
%field = fieldnames(store_fea);
%for i = 1:length(fieldnames(store_fea))
%end
store_fea.class1=store_fea.class1';
store_fea.class2=store_fea.class2';
store_fea.class3=store_fea.class3';
%{
store_fea.class4=store_fea.class4';
store_fea.class5=store_fea.class5';
store_fea.class6=store_fea.class6';
store_fea.class7=store_fea.class7';
store_fea.class8=store_fea.class8';
store_fea.class9=store_fea.class9';
store_fea.class10=store_fea.class10';
%}
m=mean(store_fea.class1);%Average feature from class1

D1=pdist2(m,store_fea.class1);
l1=plot(D1,'DisplayName','D','YDataSource','D');figure(gcf);
set(l1,'Color', Color(1,:));
%legend(l1, 'class1');
hold on;

D2=pdist2(m,store_fea.class2);
l2=plot(D2,'DisplayName','D','YDataSource','D');figure(gcf)
set(l2,'Color',Color(2,:));
%legend(l2, 'class2');

D3=pdist2(m,store_fea.class3);
l3=plot(D3,'DisplayName','D','YDataSource','D');figure(gcf)
set(l3, 'Color', Color(3,:));
%legend(l3, 'class3');
%{
D4=pdist2(m,store_fea.class4);
l4=plot(D4,'DisplayName','D','YDataSource','D');figure(gcf)
set(l4, 'Color', Color(4,:));
%legend(l4, 'class4');

D5=pdist2(m,store_fea.class5);
l5=plot(D5,'DisplayName','D','YDataSource','D');figure(gcf)
set(l5, 'Color', Color(5,:));
%legend(l5, 'class5');

D6=pdist2(m,store_fea.class6);
l6=plot(D6,'DisplayName','D','YDataSource','D');figure(gcf)
set(l6, 'Color', Color(6,:));
%legend(l6, 'class6');

D7=pdist2(m,store_fea.class7);
l7=plot(D7,'DisplayName','D','YDataSource','D');figure(gcf)
set(l7, 'Color', Color(7,:));
%legend(l7, 'class7');

D8=pdist2(m,store_fea.class8);
l8=plot(D8,'DisplayName','D','YDataSource','D');figure(gcf)
set(l8, 'Color', Color(8,:));
%legend(l8, 'class8');

D9=pdist2(m,store_fea.class9);
l9=plot(D9,'DisplayName','D','YDataSource','D');figure(gcf)
set(l9, 'Color', Color(9,:));
%legend(l9, 'class9');

D10=pdist2(m,store_fea.class10);
l10=plot(D10,'DisplayName','D','YDataSource','D');figure(gcf)
set(l10, 'Color', Color(10,:));
%legend(l10, 'class10');
%}
legend('class1', 'class2', 'class3', 'class4', 'class5', 'class6', 'class7', 'class8', 'class9', 'class10');


