require 'rails_helper'

RSpec.describe Composer, type: :model do
  let(:composer) {
    Composer.create(
      name: "Giuseppe Verdi",
      birth_year: 1813,
      death_year: 1901,
      country: "Italy"
    )
  }

  it "is valid with a name, birth_year, death_year, and country" do
    expect(composer).to be_valid
  end

  it "is not valid without name, birth_year, death_year, or country" do
    @composer = Composer.create(
      birth_year: 1813,
      death_year: 1901,
      country: "Italy"
    )
    expect(@composer).to_not be_valid

    @composer = Composer.create(
      name: "Giuseppe Verdi",
      death_year: 1901,
      country: "Italy"
    )
    expect(@composer).to_not be_valid

    @composer = Composer.create(
      name: "Giuseppe Verdi",
      birth_year: 1813,
      country: "Italy"
    )
    expect(@composer).to_not be_valid

    @composer = Composer.create(
      name: "Giuseppe Verdi",
      birth_year: 1813,
      death_year: 1901
    )
    expect(@composer).to_not be_valid
  end
end
