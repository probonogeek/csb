# These are loosely based on a few libraries that exist already that each have
# their own idiosyncrasies and problems.
#
# We're using klass.make in these macros because we're using the machinist
# gem to create less brittle test data.

def it_validates_presence_of(attribute)
  it "validates presence of #{attribute}" do
    lambda do
      invalid_model = described_class.make(attribute => nil)
    end.should raise_error(ActiveRecord::RecordInvalid, /#{attribute.to_s.humanize} can't be blank/)
  end
end

def it_validates_uniqueness_of(attribute)
  it "validates uniqueness of #{attribute}" do
    unique_value = "UniqueValue#{rand}"
    first = described_class.make(attribute => unique_value)
    lambda do
      described_class.make(attribute => unique_value)
    end.should raise_error(ActiveRecord::RecordInvalid, /#{attribute.to_s.humanize} has already been taken/)
  end
end