require "json"
require "ibm_watson/authenticators"
require "ibm_watson/tone_analyzer_v3"
include IBMWatson

class ToneService

  def self.tone_analyzer(line)
    authenticator = Authenticators::IamAuthenticator.new(
      apikey: "q1uI4zGkTXu6_EKYEWlr0cgS8CtLIQiloJDz4hHKCfrJ"
    )

    tone_analyzer = ToneAnalyzerV3.new(
      version: "2017-09-21",
      authenticator: authenticator
    )

    tone_analyzer.service_url = "https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/d1c4840e-e8ea-45fa-9e54-0d540046f43d"

    tone = tone_analyzer.tone(
      tone_input: {text: line},
      content_type: "application/json"
    )

    JSON.parse(JSON.pretty_generate(tone.result["document_tone"]), symbolize_names: true)
  end

end
