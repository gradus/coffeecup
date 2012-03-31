
module.exports = function() {
  p('This app is built using:');
  return ul(function() {
    li('Flatiron');
    li('Coffeecup');
    return li('Creamer');
  });
};
