# -*- coding: utf-8 -*-
xml.result do
  xml.status 'KO'
  xml.reason "Missing Parameters. #{@missing_parameters.join(', ')} are mandatory"
end
