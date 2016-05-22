require 'rails_helper'

RSpec.describe User, type: :model do
  let(:fullname) { 'Daniel Chinedu' }
  let(:email) { 'chinedu.daniel@andela.com' }
  let(:password) { 'sup3rstr0ngp@ssword1234' }

  subject(:user) do
    User.new do |u|
      u.fullname = fullname
      u.email = email
      u.password = password
    end
  end

  it { expect(user).to be_valid }

  describe '#fullname' do
    context 'when the fullname attribute is not present' do
      let(:fullname) { nil }
      it { expect(user).to be_invalid }
    end

    context 'when the length of the name is greater than the maximum amount' do
      let(:fullname) { 'a' * 256 }
      it { expect(user).to be_invalid }
    end

    context 'when the length of the name is not up to the required amount' do
      let(:fullname) { 'aa' }
      it { expect(user).to be_invalid }
    end

    context 'when the name contains disallowed characters' do
      let(:fullname) { 'Tydollar$$_don' }
      it { expect(user).to be_invalid }
    end
  end

  describe '#email' do
    context 'when the email attribute is not present' do
      let(:email) { nil }
      it { expect(user).to be_invalid }
    end

    context 'when the email address is invalid' do
      it "doesn't save the user record" do
        invalid_email_addresses = %w( hello kok@@mail.com jinja.me times2*@9l )

        invalid_email_addresses.each do |m|
          user = User.new(fullname: 'mark', password: 'jinjak00', email: m)
          expect(user).to be_invalid
        end
      end
    end

    context "when the email address isn't unique" do
      it "doesn't save the user record" do
        user.save

        expect(user.dup).to be_invalid
      end
    end
  end

  describe '#password' do
    context 'when the password attribute is not present' do
      let(:password) { nil }
      it { expect(user).to be_invalid }
    end

    context "when the password isn't up to the required length of 8" do
      let(:password) { 'hello' }
      it { expect(user).to be_invalid }
    end
  end
end
