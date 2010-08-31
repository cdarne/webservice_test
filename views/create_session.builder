# -*- coding: utf-8 -*-
xml.result do
  xml.status 'OK'
  xml.reason
  xml.session :id => '233745' do
    xml.status 'MSG_2', :id => '7'
    xml.createddatetime Time.now
    xml.lasupdateddatetime Time.now
    xml.service '2shotcounter', :id => @V_SERVICEID
  end

  xml.content do
    xml.item :id => '1', :type => 'form' do
      xml.text "WAP. Entrez maintenant votre numéro de mobile pour faire péter la cash machine! Ex : 06xxxxxxxx"
      xml.inputs do
        xml.input :type => 'text', :name => 'V_MSISDN', :title => "Votre numéro", :value => "06", :maxlength => "12"
      end
    end
    xml.item :id => "2", :type => "text" do
      xml.text "pub 1"
    end
    xml.item :id => "3", :type => "text" do
      xml.text "pub 2"
    end
  end
end
