require "rails_helper"

RSpec.describe UserLogin, :type => :mailer do
  describe "receipt" do
    let(:mail) { UserLogin.receipt }

    it "renders the headers" do
      expect(mail.subject).to eq("Receipt")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
