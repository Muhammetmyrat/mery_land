import axios from "axios";
const AuthenticatorResponse = ({ commit }, data) => {
  commit("setAuthenticated", data);
};

//Take or Check token and use it
const fetchAuthToken = ({ commit }) => {
  let token = window.localStorage["auth._token.local"];
//   console.log(token);
  commit("setAuthToken", token);
};

const fetchPassToken = ({ commit }) => {
  let token = window.localStorage["auth._token.local2"];
//   console.log("TOKEN", token);
  commit("setPassToken", token);
};

const fetchDates = async ({ commit, getters }, url) => {
  try {
   //  console.log("fuck", getters.getAuthToken);
    let token = getters.getAuthToken;
    let dates = await axios.get(`http://10.192.1.52:3000/api/admin/${url}`, {
      headers: {
        Authorization: getters.getAuthToken,
      },
    });
   //  console.log(dates);
    commit("setDates", dates.data);
   //  console.log("fuck", dates);
   //  console.log("GET", getters.setDates);
  } catch (err) {
   //  console.log(err);
  }
};

const deleteOrCreateOrUpdateOneData = async (
  { commit, getters },
  { url, data }
) => {
  try {
    let some = await axios.post(
      `http://10.192.1.52:3000/api/admin/${url}`,
      data,
      {
        headers: {
          Authorization: getters.getAuthToken,
        },
      }
    );
  } catch (err) {
   //  console.log("ERR", err);
  }
};

const deleteOrCreateOrUpdateOneData2 = async (
  { commit, getters },
  { url, data }
) => {
  try {
    let some = await axios.post(
      // `http://10.192.1.52:3000/api/login/${url}`,
      data,
      {
        headers: {
          Authorization: getters.getPassToken,
        },
      }
    );
  } catch (err) {
   //  console.log("ERR", err);
  }
};

const fetchGetOneData = async ({ commit, getters }, { url }) => {
  try {
    let data = await axios.get(`http://10.192.1.52:3000/api/admin/${url}`, {
      headers: {
        Authorization: getters.getAuthToken,
      },
    });
    commit("setGetteredDates", data);
   //  console.log("HHHH", data);
    //  this.forInDates(data);
  } catch (e) {
   //  console.log(e);
  }
};

// const newPhotoSelect = async ({ commit }, e) => {
//   let files = e.target.files;
//   //|| e.dataTransfer.files
//   if (!files.length) return;
//   console.log("IMAGE", files[0]);
//   // this.image = await files[0];
//   await commit("setIMG", files[0]);
// };

const collectCategoriesId = async ({ commit }, { categories_id }) => {
  let arr = categories_id;
  let arr2 = [];
//   console.log("FFF", categories_id);
  let obj1 = new Object();
  obj1.categories_id = new Number();
  obj1.title = new Number();

  let obj2 = new Object();
  obj2.categories_id = new Number();
  obj2.title = new Number();

  for (let i in arr) {
    obj1.categories_id = arr[i].id;
    obj1.title = arr[i].name;
    arr2.push(obj1);
    obj1 = obj2;
  }
  commit("setCategoriesId", arr2);
};

const sortedImgArray = async ({ commit, getters }) => {
  let arr = getters.getDates;
  let arr2 = [];

  let obj1 = new Object();
  obj1.id = 0;
  obj1.image1 = new Number();
  obj1.id1 = new Number();
  obj1.image2 = new Number();
  obj1.id2 = new Number();

  let obj2 = new Object();
  obj2.id = 0;
  obj2.image1 = new Number();
  obj2.id1 = new Number();
  obj2.image2 = new Number();
  obj2.id2 = new Number();
  for (let i in arr) {
    if (obj2.image1 == 0) {
      obj2.image1 = arr[i].image_path;
      obj2.id1 = arr[i].id;
      obj1.id++;
      obj2.id = obj1.id;
      // console.log("1", obj2.image1);
    } else if (obj2.image2 == 0) {
      obj2.image2 = arr[i].image_path;
      obj2.id2 = arr[i].id;
      // console.log("2", obj2.image2);
      arr2.push(obj2);
      obj2 = obj1;
    }
    // this.arr = arr2;
   //  console.log("ARR", this.arr);
  }
  commit("setImgArray", arr2);
//   console.log("ARR", arr2);
};

export default {
  AuthenticatorResponse,
  fetchAuthToken,
  fetchPassToken,
  deleteOrCreateOrUpdateOneData,
  //
  deleteOrCreateOrUpdateOneData2,
  //
  fetchDates,
  fetchGetOneData,
  //newPhotoSelect,
  sortedImgArray,
  collectCategoriesId,
};
