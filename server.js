// server.js
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.urlencoded({ extended: false }));

app.get('/number', (req, res) => {
  const no = req.query.number

  function factorial(no)
  {
    
    if (no === 0) 
    {
      return 1;
    }
    
    else 
    {
      let fact = 1;
      for (i = 1; i <= no; i++) 
      {
          fact *= i;
      }
      return fact;
    }
  
  }
  
  const fact = factorial(no)
  
  res.send('The factorial of number is' + fact);

});



app.listen(port, () => {console.log(`Success! Your application is running on port ${port}.`);
});
