# These are loosely based on a few libraries that exist already that each have
# their own idiosyncrasies and problems.
#
# We're using klass.make in these macros because we're using the machinist
# gem to create less brittle test data.

def it_makes_valid(described_class)
  it "makes a valid #{described_class.to_s}" do
    model = described_class.make
    model.class.should == described_class
  end
end

def it_validates_presence_of(attribute,described_class)
  it "validates presence of #{attribute}" do
    lambda do
      invalid_model = described_class.make(attribute => nil)
    end.should raise_error(ActiveRecord::RecordInvalid, /#{attribute.to_s.humanize} can't be blank/)
  end
end

def it_validates_uniqueness_of(attribute,described_class)
  it "validates uniqueness of #{attribute}" do
    model = described_class.make
    lambda do
      described_class.make(attribute => model.__send__( attribute ) )
    end.should raise_error(ActiveRecord::RecordInvalid, /#{attribute.to_s.humanize} has already been taken/)
  end
end