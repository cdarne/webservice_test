# -*- coding: utf-8 -*-
xml.result do
  xml.status 'OK'
  xml.reason
  xml.session :id => @V_SESSIONID do
    xml.status 'TERMINATED', :id => '5'
    xml.createddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.lastupdateddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.service '2shotcounter - fils wap', :id => @V_SERVICEID
    xml.stopsession 'true'
    xml.wonprize 'cd'
    xml.nextprice 'voyage'
    xml.msisdn @V_MSISDN
    xml.nextcounter '2'
  end

  xml.content do
    xml.item :id => "1", :type => "text" do
      xml.text "Bravo tu as gagné un CD"
    end
  end
end