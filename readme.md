LOCAL DEVELOPMENT:
1. Create a virtual environmet and install the libraries in requirements.txt with `pip install -r requirements.txt`
2. Run the Flask server with `flask run`
3. Open a different terminal and go to the frontend folder with `cd frontend`
4. Install react libraries: `npm install`
5. Start the react server with `npm start`

6. Note that both servers (Flask on port 5000 and React on port 3000) have to run at the same time for the web to work
In frontend/package.json there is a line that configures a proxy so that the requests made in React are routed to Flask:
`"proxy": "http://127.0.0.1:5000"`

AZURE DEPLOYMENT.
1. (One time only) Create the Azure 'App Service Plan' and a python web app.
2. (One time only) Go to the web app in Azure portal. Settings/Configuration/'General settings'
Find 'Startup Commands' and enter the following line:
`gunicorn --bind=0.0.0.0 --timeout 600 wsgi:app`
3. (On every deployment) Build the react app. 
```cd frontend
npm run build```
This will create a build folder in the `frontend` folder
4. (On every deployment) Execute after-build.ps1 to move build folder to ../static
`after-build.ps1`
5. (On every deployment) Deploy to web app using VSCode
