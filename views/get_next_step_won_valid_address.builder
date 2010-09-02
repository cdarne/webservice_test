# -*- coding: utf-8 -*-
xml.result do
  xml.status 'OK'
  xml.reason
  xml.session :id => @V_SESSIONID do
    xml.status 'TERMINATED', :id => '6'
    xml.createddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.lasupdateddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.service '2shotcounter - fils wap', :id => @V_SERVICEID
    xml.stopsession 'true'
    xml.wonprize 'cd'
    xml.nextprice 'voyage'
    xml.msisdn @V_MSISDN
    xml.nextcounter '2'
    xml.address @V_ADDRESS
  end

  xml.content do
    xml.item :id => "1", :type => "text" do
      xml.text "Merci, nous t'envoyons tout ça très vite"
    end
  end
end