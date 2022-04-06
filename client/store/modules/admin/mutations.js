const setAuthenticated = (state, data) => {
  state.isAuthenticated = data;
};
const setHomeSliders = (state, data) => {
  state.homeSliders = data;
};

const setHomeText = (state, data) => {
  state.homeText = data;
};

const setDates = (state, data) => {
  if (data.image == undefined) {
    state.Dates = data.data.sort((item1, item2) => {
      return item1.id - item2.id;
    });
  } else {
    let newArr = data.data;
    newArr.map((item) => {
      item.image_path = data.image[0].image_path;
    });
   //  console.log("newArr", newArr);
    //data.data.image_path = data.image[0].image_path;
    state.Dates = newArr;
  }
};

const setCategoriesId = (state, data) => {
  state.categoriesId = data;
};

const setAuthToken = (state, data) => {
  state.authToken = data;
};
const setPassToken = (state, data) => {
  state.passToken = data;
};
const setGetteredDates = (state, data) => {
  state.getteredDates = data;
};

const setIMG = (state, data) => {
  state.img = data;
};

const setImgArray = (state, data) => {
  state.imgArray = data;
};

export default {
  setAuthenticated,
  setHomeSliders,
  setHomeText,
  setAuthToken,
  setPassToken,
  setDates,
  setGetteredDates,
  setIMG,
  setImgArray,
  setCategoriesId,
};
