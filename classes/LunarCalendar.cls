public Class LunarCalendar{

public Integer startYear=1900;
  /* the start dates of the Chinese new year in format month.day */
  /* this structure should be read startDate[0]= */
public List<String> cNYstartDate = new List<String>{'1.31','2.19','2.08','1.29','2.16','2.04','1.25','2.13','2.02','1.22', '2.10','1.30','2.18','2.06','1.26','2.14','2.03','1.23','2.11','2.01', '2.20','2.08','1.28','2.16','2.05','1.25','2.13','2.02','1.23','2.10', '1.30','2.17','2.06','1.26','2.14','2.04','1.24','2.11','1.31','2.19', '2.08','1.27','2.15','2.05','1.25','2.13','2.02','1.22','2.10','1.29', '2.17','2.06','1.27','2.14','2.03','1.24','2.12','1.31','2.18','2.08', '1.28','2.15','2.05','1.25','2.13','2.02','1.21','2.09','1.30','2.17', '2.06','1.27','2.15','2.03','1.23','2.11','1.31','2.18','2.07','1.28', '2.16','2.05','1.25','2.13','2.02','2.20','2.09','1.29','2.17','2.06', '1.27','2.15','2.04','1.23','2.10','1.31','2.19','2.07','1.28','2.16', '2.05','1.24','2.12','2.01','1.22','2.09','1.29','2.18','2.07','1.26', '2.14','2.03','1.23','2.10','1.31','2.19','2.08','1.28','2.16','2.05', '1.25','2.12','2.01','1.22','2.10','1.29','2.17','2.06','1.26','2.13'};
    
Date dateToday = System.today();
Integer y_select = 1981;
public List<String> y_option = new List<String>(); /* the newly created options */
Map<Integer,String> zodiacMap = new Map<Integer,String>();

    public LunarCalendar(){
        
        zodiacMap.put(0,'Rat');
        zodiacMap.put(1,'Ox');
        zodiacMap.put(2,'Tiger');
        zodiacMap.put(3,'Rabbit');
        zodiacMap.put(4,'Dragon');
        zodiacMap.put(5,'Snake');
        zodiacMap.put(6,'Horse');
        zodiacMap.put(7,'Sheep');
        zodiacMap.put(8,'Monkey');
        zodiacMap.put(9,'Rooster');
        zodiacMap.put(10,'Dog');
        zodiacMap.put(11,'Pig');
        

    }

    public void calculateZodiac(){
        
          Integer m_select = 11;
          Integer d_select = 13;
          
          Integer cYear;  /* the same year as gregorian, except that if date<chineseNewYear than tis the previous */
          Integer anYear; /* the assigned year number (1-12) */
          Integer edgeMonth;
          Double edgeDay;
          
            if( (y_select != null)&&(m_select !=null)&&(d_select!= null) )
              { 
                edgeMonth=Integer.valueOf(cNYstartDate[y_select-1900].substring(0,cNYstartDate[y_select-1900].indexOf('.')));
                if( (m_select) < edgeMonth )
                  {
                    cYear=y_select-1;
                  } else
                  {
                    if(m_select == edgeMonth )
                    {
                      edgeDay=Double.valueOf(cNYstartDate[y_select-1900].substring(Integer.valueOf(cNYstartDate[y_select-1900].indexOf('.'))+1,cNYstartDate[y_select-1900].length()));
                      if((d_select)<edgeDay )
                      {
                        cYear=y_select-1;
                      } else { cYear=y_select; }
                    } else 
                    { cYear=y_select; }
                  }
                if(cYear<1900)
                {
                  //descArea.innerHTML="Sorry, no info for this date, because it's before 1900, according to Chinese calendar. The Chinese new year starts on jan 31 in Year 1900.";
                } else
                {
                  anYear= math.mod((cYear-4), 12);
                  system.debug('--anYEar--' + anYear);
                  system.debug('#####--' + zodiacMap.get(anYear));
                  //descArea.innerHTML="<h4>"+zodiac[anYear][0]+"</h4>"+zodiac[anYear][1];
                  //document.getElementById('zodSign').src = 'images/' + zodiac[anYear][2];
                }
              }
    }


}