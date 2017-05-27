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

    context 'レンタル日が今日以前の場合' do
      let(:date) { Date.today - 1.day}

      it{ is_expected.to eq 0 }
    end

    context 'レンタル日が今日以降の場合' do
      context 'レンタル日が7日後の場合' do
        let(:date) { Date.today + 7.day}

        it{ is_expected.to eq 70 }
      end
      context 'レンタル日が8日後の場合' do
        let(:date) { Date.today + 8.day}

        it{ is_expected.to eq 72 }
      end
      context 'レンタル日が14日後の場合' do
        let(:date) { Date.today + 14.day }

        it{ is_expected.to eq 126 }
      end
      context 'レンタル日が15日後の場合' do
        let(:date) { Date.today + 15.day }

        it{ is_expected.to eq 120 }
      end
      context 'レンタル日が21日後の場合' do
        let(:date) { Date.today + 21.day }

        it{ is_expected.to eq 168 }
      end
      context 'レンタル日が22日後の場合' do
        let(:date) { Date.today + 22.day }

        it{ is_expected.to eq 154 }
      end
    end
  end
end
