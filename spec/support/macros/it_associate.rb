# These are loosely based on a few libraries that exist already that each have
# their own idiosyncrasies and problems.
#
# We're using klass.make in these macros because we're using the machinist
# gem to create less brittle test data.

def it_belongs_to(association,described_class)

  it "belongs_to #{association}" do
    associated_model = association.to_s.camelize.constantize.make
    source_model = associated_model.__send__( described_class.to_s.tableize ).make
    source_model.__send__(association).should == associated_model
  end

end

def it_has_one_through(through_association,association,described_class)

  it "has_one #{through_association} through #{association}" do
    associated_through_model = through_association.to_s.camelize.constantize.make
    associated_model = associated_through_model.__send__( association.to_s.tableize ).make
    source_model = associated_model.__send__( described_class.to_s.tableize ).make
    source_model.__send__( through_association ).should == associated_through_model
  end

end

def it_has_many(association,described_class)
  it "has many #{association}" do
    source_model = described_class.make
    associated_model = source_model.__send__(association).make

    source_model.__send__(association).should == [associated_model]
  end
end

def it_has_many_through(through_association,association,described_class)
  it "has_many #{through_association} through #{association}" do
    source_model = described_class.make
    associated_model = source_model.__send__(association).make
    associated_through_model = associated_model.__send__(through_association).make

    source_model.__send__(through_association).should == [associated_through_model]
  end
end