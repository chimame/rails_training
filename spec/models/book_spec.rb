require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#full_title' do
    let(:book) { Book.new(title: title, sub_title: sub_title) }
    let(:title) { 'D・N・A2' }
    subject { book.full_title }

    context 'sub_titleがない場合' do
      let(:sub_title) { nil }
      it { is_expected.to eq 'D・N・A2 - ' }
    end
    
    context 'sub_titleがある場合' do
      let(:sub_title) { '何処かで失くしたあいつのアイツ' }
      example 'タイトルとサブタイトルが結合されること' do
        expect(book.full_title).to eq 'D・N・A2 - 何処かで失くしたあいつのアイツ'
      end
    end
  end

  describe '#calculate_loan_charge_from' do
    let(:book) { Book.new(price: 100) }
    subject{ book.calculate_loan_charge_from(date) }
    let(:date) { Date.today + 2.day}

    before do
      allow(book).to receive(:rental_period_from).and_return(3)
      allow(book).to receive(:rental_unit_price_by).and_return(10)
    end

    it { is_expected.to eq 30 }
  end

  describe '#rental_period_from' do
    let(:book) { Book.new }
    subject{ book.rental_period_from(date) }
    context 'レンタル日が今日以前の場合' do
      let(:date) { Date.today - 1.day}
      it{ is_expected.to eq 0 }
    end

    context 'レンタル日が今日以降の場合' do
      let(:date) { Date.today + 2.day}
      it{ is_expected.to eq 2 }
    end
  end

  describe '#rental_unit_price_by' do
    let(:book) { Book.new(price: 100) }
    subject{ book.rental_unit_price_by(rental_period) }

    context 'レンタル日が7日後の場合' do
      let(:rental_period) { 7 }

      it{ is_expected.to eq 10 }
    end
    context 'レンタル日が8日後の場合' do
      let(:rental_period) { 8 }

      it{ is_expected.to eq 9 }
    end
    context 'レンタル日が14日後の場合' do
      let(:rental_period) { 14 }

      it{ is_expected.to eq 9 }
    end
    context 'レンタル日が15日後の場合' do
      let(:rental_period) { 15 }

      it{ is_expected.to eq 8 }
    end
    context 'レンタル日が21日後の場合' do
      let(:rental_period) { 21 }

      it{ is_expected.to eq 8 }
    end
    context 'レンタル日が22日後の場合' do
      let(:rental_period) { 22 }

      it{ is_expected.to eq 7 }
    end
  end
end
