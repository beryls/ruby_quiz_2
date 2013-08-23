require_relative '../quiz'
#  __    __    _______  __    __
# |  |  |  |  /  _____||  |  |  |
# |  |  |  | |  |  __  |  |__|  |
# |  |  |  | |  | |_ | |   __   |
# |  `--'  | |  |__| | |  |  |  |
#  \______/   \______| |__|  |__|

describe "a quiz" do
  it "should be about Ruby and Testing in Rspec" do
    expect(QUIZ_TOPICS).to include("ruby")
    expect(QUIZ_TOPICS).to include("rspec")
    expect(QUIZ_TOPICS).to include("testing")
  end
end

describe "an object called quiz" do
  quiz = Quiz.new
  it "should be an object with a class of Quiz" do
    expect(quiz.class).to eq(Quiz)
  end

  it "should start with an empty numbers array" do
    expect(quiz.numbers).to eq([])
  end

  it "should start with an empty trash array" do
    expect(quiz.trash).to eq([])
  end

  it "should not allow access or addition to the array directly" do
    expect{quiz.nums}.to raise_error(NoMethodError)
    expect{quiz.nums.push(4)}.to raise_error(NoMethodError)
  end

  it "should allow for adding numbers to the array" do
    quiz.add(5)
    quiz.add(3)
    expect(quiz.numbers).to eq([5, 3])
  end

  it "should not allow for adding strings to the array" do
    quiz.add("wakka")
    expect(quiz.numbers).to eq([5, 3])
  end

  it "should allow for adding numbers in arrays to the quiz array" do
    quiz.add([4, 3, true, 9, "7"])
    expect(quiz.numbers).to eq([5, 3, 4, 3, 9])
  end

  it "should send all rejected additions to the trash array" do
    expect(quiz.trash).to eq(["wakka", true, "7"])
  end

  it "should allow for a count of the instances of a number in the array" do
    expect(quiz.count(3)).to eq(2)
    expect(quiz.count(5)).to eq(1)
    expect(quiz.count("x-ty 6")).to eq(0)
  end

  it "should have a rotate method that changes the array" do
    quiz.rotate(2)
    expect(quiz.numbers).to eq([4, 3, 9, 5, 3])
  end

  it "should have a count evens method that returns the count of even numbers" do
    expect(quiz.count_evens).to eq(1)
    quiz.add(66)
    expect(quiz.count_evens).to eq(2)
  end
end

# more in quiz.rb!