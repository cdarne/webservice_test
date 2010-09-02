# -*- coding: utf-8 -*-
xml.result do
  xml.status 'OK'
  xml.reason
  xml.session :id => @V_SESSIONID do
    xml.status 'TERMINATED', :id => '5'
    xml.createddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.lasupdateddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.service '2shotcounter - fils wap', :id => @V_SERVICEID
    xml.stopsession 'false'
    xml.wonprize
    xml.nextprice 'voyage'
    xml.msisdn @V_MSISDN
  end

  xml.content do
    xml.item :id => "1", :type => "text" do
      xml.text "perdu"
    end
  end
end