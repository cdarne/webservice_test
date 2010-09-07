# -*- coding: utf-8 -*-
xml.result do
  xml.status 'KO'
  xml.reason "Invalid MSISDN #{@V_MSISDN}"
  xml.session :id => @V_SESSIONID do
    xml.status 'MSG_2', :id => '7'
    xml.createddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.lastupdateddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.service '2shotcounter - fils wap', :id => @V_SERVICEID
    xml.stopsession 'false'
  end

  xml.content do
    xml.item :id => '1', :type => 'form' do
      xml.text "Désolé, renvoie ton numéro"
      xml.inputs do
        xml.input :type => 'text', :name => 'V_MSISDN', :title => "Votre numéro", :value => "06xxxxxxxx", :maxlength => "12"
      end
    end
  end
end