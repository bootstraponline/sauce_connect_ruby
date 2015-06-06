# Asserts obj is true
#
# @param obj [Object] the object to assert is true
def expect_true obj
  expect(obj).to eq(true)
end
