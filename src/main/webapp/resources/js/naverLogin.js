
   let naver_login=new naver_id_login("qk0U6UAcX7QvyGwuq2H5", "http://localhost:82");
        let state = naver_login.getUniqState();
        naver_login.setButton("white", 2,40);
        naver_login.setDomain("http://localhost:82");
        naver_login.setState(state);
        naver_login.setPopup();
        naver_login.init_naver_id_login();
   