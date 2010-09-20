# -*- coding: utf-8 -*-
require 'active_support/secure_random'
xml.result do
  xml.status 'OK'
  xml.reason
  xml.session :id => ActiveSupport::SecureRandom.hex do
    xml.status 'MSG_2', :id => '7'
    xml.createddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.lastupdateddatetime Time.now.strftime("%Y/%m/%d %H:%M:%S")
    xml.service '2shotcounter - fils wap', :id => @V_SERVICEID
    xml.stopsession 'false'
  end

  xml.content do
    xml.item :id => '1', :type => 'form' do
      xml.text "WAP. Entrez maintenant votre numéro de mobile pour faire péter la cash machine! Ex : 06xxxxxxxx"
      xml.inputs do
        xml.input :type => 'text', :name => 'V_MSISDN', :title => "Votre numéro", :value => "06xxxxxxxx", :maxlength => "12"
      end
    end
    xml.item :id => "2", :type => "link" do
      xml.text "Pub ! Promo, cliques ici !"
      xml.url "http://google.com"
    end
    xml.item :id => "3", :type => "text" do
      xml.text "pub 2"
    end
  end
end
