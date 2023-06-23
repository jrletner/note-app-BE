class TokenBlueprint < Blueprinter::Base
  #Don't really have a need to return the Token ID in the payload
  #identifier :id
  fields :expiry, :revocation_date, :value
end
