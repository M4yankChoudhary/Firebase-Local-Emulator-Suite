import './App.css';
import {useState} from 'react';
import { initializeApp } from "firebase/app";
import { getAuth, connectAuthEmulator, createUserWithEmailAndPassword } from "firebase/auth";
// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "",
  authDomain: "fir-localsuite.firebaseapp.com",
  projectId: "firebaselocalsuite",
  storageBucket: "firebaselocalsuite.appspot.com",
  messagingSenderId: "",
  appId: ""
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth();
connectAuthEmulator(auth, "http://127.0.0.1:9099");


function App() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const signup = () => {
    console.log(email)
    createUserWithEmailAndPassword(auth, email?.toString(), password?.toString())
    .then((data) => {
      console.log(data.user?.email)
    }).catch(e => console.log(e))
  }
  return (
    <div className="App" style={{
      height: '100vh',
      display: 'flex',
      justifyContent:'center',
      alignItems:'center',
      gap: '12px',
      flexDirection: 'column'
    }}>
      <input type="text" defaultValue={email} onChange={(e) => setEmail(e.target.value)} placeholder="Email"/>
      <input type="password" defaultValue={password} onChange={(e) => setPassword(e.target.value)} placeholder="Password"/>
      <input type="button" onClick={() => signup()} value="Submit"/>
    </div>
  );
}

export default App;
