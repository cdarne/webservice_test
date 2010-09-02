# -*- coding: utf-8 -*-
xml.result do
  xml.status 'OK'
  xml.reason
  xml.session :id => @V_SESSIONID do
    xml.status 'WAITING', :id => '6'
    xml.createddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.lastupdateddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.service '2shotcounter - fils wap', :id => @V_SERVICEID
    xml.stopsession 'false'
    xml.wonprize 'cd'
    xml.nextprice 'voyage'
    xml.msisdn @V_MSISDN
    xml.nextcounter '2'
  end

  xml.content do
    xml.item :id => "1", :type => "form" do
      xml.text "Bravo tu as gagné un CD, envoie maintenant ton adresse"
      xml.inputs do
        xml.input :type => 'text', :name => 'V_ADDRESS', :title => "Ton adresse",
          :value => '', :maxlength => '120'
      end
    end
  end
end