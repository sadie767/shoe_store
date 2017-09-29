require('spec_helper')

describe(Tracker) do
  it { should belong_to(:brand) }
  it { should belong_to(:store)}
end
