require 'rails_helper'

RSpec.describe Period, type: :model do
  describe '#valid?' do
    context 'year' do
      it 'returns false when start_year is a negative number' do
        period = build(:period, start_year: -1990)

        expect(period.valid?).to be false
        expect(period.errors).to include :start_year
      end

      it 'returns false when end_year is a negative number' do
        period = build(:period, end_year: -1999)

        expect(period.valid?).to be false
        expect(period.errors).to include :end_year
      end

      it 'returns false when start_year is greater than end_year' do
        period = build(:period, start_year: 1820, end_year: 1730)

        expect(period.valid?).to be false
        expect(period.errors).to include :end_year
      end
    end

    context 'name' do
      it 'returns false when name is empty' do
        period = build(:period, name: '')

        expect(period.valid?).to be false
        expect(period.errors).to include :name
      end

      it 'returns false when name is longer than 50 characters' do
        period = build(:period, name: 'a period with a name that is over 50 characters long')

        expect(period.valid?).to be false
        expect(period.errors).to include :name
      end
    end

    context 'description' do
      it 'returns true when description is empty' do
        period = build(:period, description: '')

        expect(period.valid?).to be true
        expect(period.errors).to be_empty
      end

      it 'returns false when description is longer than 500 characters' do
        period = build(:period, description: <<-DESCRIPTION
            Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim
            labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet.
            Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum
            Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim
            labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet.
            Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum
            Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident.
            Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex
            occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat
            officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in
            Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non
            excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut
            ea consectetur et est culpa et culpa duis.est aliquip amet voluptate
            voluptate dolor minim nulla est proident. Nostrud officia pariatur ut
            officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit
            commodo officia dolor Lorem duis laboris cupidatat officia voluptate.
            Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis
            officia eiusmod.
        DESCRIPTION
        )

        expect(period.valid?).to be false
        expect(period.errors).to include :description
      end
    end
  end
end
