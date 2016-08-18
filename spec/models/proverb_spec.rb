require 'rails_helper'

RSpec.describe Proverb, type: :model do
  let(:proverb) { create(:proverb) }
  let(:translation) {create(:proverb, root: proverb)}

  it{ is_expected.to respond_to(:lang) }
  it{ is_expected.to respond_to(:body) }
  it{ is_expected.to respond_to(:root) }
  it{ is_expected.to respond_to(:translations) }
  it{ is_expected.to validate_presence_of(:body) }
  it{ is_expected.to validate_presence_of(:lang) }

  it "should return a translation for proverb" do
    expect(proverb.translations).to eq [translation]
  end

  it "should return a translation for translation" do
    expect(translation.translations).to eq [proverb]
  end

  it "should return a root for translation" do
    expect(translation.root).to eq proverb
  end
end
