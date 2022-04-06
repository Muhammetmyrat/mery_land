import { request } from "@/api/apiRequest";

const fetchHeaderDatas = async ({ commit }, { url, $nuxt }) => {
  try {
    const getHeaderData = await request(url)
    commit("setHeaderDatas", getHeaderData)
  } catch (e) {
    if (e && e.response && e.response.status === 404) {
      return $nuxt.error({ statusCode: 404, message: e.message });
    }
  }
}

const fetchFooterDatas = async ({ commit }, { url, $nuxt }) => {
  try {
    const getFooterDatas = await request(url);
    commit("setFooterDatas", getFooterDatas);
  } catch (e) {
    if (e && e.response && e.response.status === 404) {
      return $nuxt.error({ statusCode: 404, message: e.message });
    }
  }
};

const fetchHomeBodyDatas = async ({ commit }, { url, $nuxt }) => {
  try {
    const getHomeBodyDatas = await request(url);
    commit("setHomeBodyDatas", getHomeBodyDatas);
  } catch (e) {
    if (e && e.response && e.response.status === 404) {
      return $nuxt.error({ statusCode: 404, message: e.message });
    }
  }
};

const fetchAboutBodyDatas = async ({ commit }, { url, $nuxt }) => {
  try {
    const getAboutBodyDatas = await request(url)
    commit("setAboutImages", getAboutBodyDatas)
    commit("setAboutBodyDatas", getAboutBodyDatas.data)
    commit("setAboutBodySliderImages", getAboutBodyDatas.slider_images)
  } catch (e) {
    if (e && e.response && e.response.status === 404) {
      return $nuxt.error({ statusCode: 404, message: e.message })
    }
  }
}

const fetchContactBodyDatas = async ({ commit }, { url, $nuxt }) => {
  try {
    const getContactBodyDatas = await request(url)
    commit("setContactBodyDatas", getContactBodyDatas)
  } catch (e) {
    if (e && e.response && e.response.status === 404) {
      return $nuxt.error({ statusCode: 404, message: e.message })
    }
  }
}

const fetchProductBodyDatas = async ({ commit }, { url, $nuxt }) => {
  try {
    const getProductBodyDatas = await request(url)
    commit("setProductBodyDatas", getProductBodyDatas)
  } catch (e) {
    if (e && e.response && e.response.status === 404) {
      return $nuxt.error({ statusCode: 404, message: e.message })
    }
  }
}

const fetchProductCategoryBodyDatas = async ({ commit }, { url, $nuxt }) => {
  try {
    const getProductCategoryBodyDatas = await request(url)
    commit("setProductCategoryBodyDatas", getProductCategoryBodyDatas)
  } catch (e) {
    if (e && e.response && e.response.status === 404) {
      return $nuxt.error({ statusCode: 404, message: e.message })
    }
  }
}

const fetchServicesBodyDatas = async ({ commit }, { url, $nuxt }) => {
  try {
    const getServicesBodyDatas = await request(url)
    commit("setServicesBodyDatas", getServicesBodyDatas.data)
  } catch (e) {
    if (e && e.response && e.response.status === 404) {
      return $nuxt.error({ statusCode: 404, message: e.message })
    }
  }
}

const fetchSearchDatas = async ({ commit }, { url, $nuxt }) => {
	try {
	  const getSearchDatas = await request(url)
	  commit("setSearchDatas", getSearchDatas.data)
	} catch (e) {
	  if (e && e.response && e.response.status === 404) {
		 return $nuxt.error({ statusCode: 404, message: e.message })
	  }
	}
 }

export default {
  fetchHeaderDatas,
  fetchFooterDatas,
  fetchHomeBodyDatas,
  fetchAboutBodyDatas,
  fetchContactBodyDatas,
  fetchProductBodyDatas,
  fetchProductCategoryBodyDatas,
  fetchServicesBodyDatas,
  fetchSearchDatas
}
