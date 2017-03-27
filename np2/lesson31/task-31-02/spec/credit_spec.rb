require 'rspec'
require_relative '../lib/credit'

describe 'Credit Class' do
  context '#approve? method' do
    it 'approve request' do
      request = approve_request
      credit = Credit.new(request[:age], request[:sex], request[:income], request[:history], request[:amount])
      expect(credit.approve?).to be_truthy
    end

    it 'reject request' do
      request = reject_request
      credit = Credit.new(request[:age], request[:sex], request[:income], request[:history], request[:amount])
      expect(credit.approve?).to be_falsey
    end
  end

  context '#calculate method' do
    it 'returns right rating' do
      request = approve_request
      credit = Credit.new(request[:age], request[:sex], request[:income], request[:history], request[:amount])
      expect(credit.rating).to eq 90
    end

    it 'returns right rating (part 2)' do
      request = reject_request
      credit = Credit.new(request[:age], request[:sex], request[:income], request[:history], request[:amount])
      expect(credit.rating).to eq 0
    end

    it 'returns nil when repeat calculate' do
      request = reject_request
      credit = Credit.new(request[:age], request[:sex], request[:income], request[:history], request[:amount])
      result = credit.calculate
      expect(result).to eq nil
    end
  end
end

# Заявка, которая должна быть одобрена
def approve_request
  {
    age: 45,
    sex: 2,
    income: 50000,
    history: 1,
    amount: 5000
  }
end

# Заявка, которая должна быть отклонена
def reject_request
  {
    age: 15,
    sex: 1,
    income: 10000,
    history: 2,
    amount: 55000
  }
end