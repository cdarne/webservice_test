# -*- coding: utf-8 -*-
xml.result do
  xml.status 'OK'
  xml.reason
  xml.session :id => @V_SESSIONID do
    xml.status 'STOP', :id => '15'
    xml.createddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.lasupdateddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.service '2shotcounter - fils wap', :id => @V_SERVICEID
    xml.stopsession 'true'
  end

  xml.content do
    xml.item :id => "1", :type => "text" do
      xml.text "WAP Votre participation a été remise à zéro."
    end
  end
end
