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
end
