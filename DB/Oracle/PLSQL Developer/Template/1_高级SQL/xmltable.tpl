SELECT *
  FROM xmltable('$B/mets/KEWOR' passing ---这里指定根节点
                 xmltype('<mets TYPE="电子资源" LABEL="数据">
  <KEWOR>挠性航天器</KEWOR>
  <KEWOR>姿态机动</KEWOR>
  <KEWOR>直接自适应控制</KEWOR>
  <KEWOR>振动抑制</KEWOR>
  <CREAT>刘敏</CREAT>
  <CREAT>徐世杰</CREAT>
  <CREAT>韩潮</CREAT>
</mets>') AS B columns KEWOR VARCHAR2(32) path '/KEWOR');
