import repository from './repository';

const initData = {
    title: '',
    category_id: { name: '', code: '' },
    tourist_segment_id: { name: '', code: '' },
    additional_services_id: '',
    type_transportation_id: 1,
    from_province_id: '',
    to_province_id: '',
    number_of_day: '',
    itinerary_highlight: '',
    policy: '',
    note: ''
};

const tourDateData = {
    tour_id: '',
    day: '',
    title: '',
    body: '',
    food_spot_id: '',
    hotel_spot_id: ''
};

export default {
    namespaced: true,
    state: {
        tourData: { ...initData },
        tourDateData: { ...tourDateData },
        dataList: {
            categoriesList: [],
            touristSegmentsList: [],
            typesTransportationList: [],
            locationList: [],
            additionalServicesList: [],
            foodSpotsList: [],
            hotelSpotsList: []
        },
        btnUpdateTour: {
            backDisable: true,
            nextDisable: true,
            btnList: true,
            btnUpdate: false
        }
    },
    mutations: {
        setBtnUpdateTour(state, data) {
            state.btnUpdateTour.backDisable = data.backDisable;
            state.btnUpdateTour.nextDisable = data.nextDisable;
            state.btnUpdateTour.btnList = data.btnList;
            state.btnUpdateTour.btnUpdate = data.btnUpdate;
        },
        setCategoriesList(state, data) {
            state.dataList.categoriesList = data;
            state.tourData.category_id.name = data[0].name;
            state.tourData.category_id.code = data[0].id;
        },
        setTouristSegmentsList(state, data) {
            state.dataList.touristSegmentsList = data;
            state.tourData.tourist_segment_id.name = data[0].name;
            state.tourData.tourist_segment_id.code = data[0].id;
        },
        setTypesTransportationList(state, data) {
            state.dataList.typesTransportationList = data;
        },
        setLocationList(state, data) {
            state.dataList.locationList = data;
        },
        setAdditionalServicesList(state, data) {
            state.dataList.additionalServicesList = data;
        },
        setFoodSpotsList(state, data) {
            state.dataList.foodSpotsList = data;
        },
        setHotelSpotsList(state, data) {
            state.dataList.hotelSpotsList = data;
        }
    },
    actions: {
        getAllCategories(context) {
            try {
                repository.getAllCategories().then((res) => {
                    const { data } = res;
                    console.log(data.Data);
                    if (data.Code == 200) {
                        context.commit('setCategoriesList', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('Action login: ' + e.message);
            }
        },
        getAllSegment(context) {
            try {
                repository.getAllSegment().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit(
                            'setTouristSegmentsList',
                            data.Data ?? ''
                        );
                    }
                });
            } catch (e) {
                console.log('Action login: ' + e.message);
            }
        },
        getAllTypesTransportation(context) {
            try {
                repository.getAllTypesTransportation().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit(
                            'setTypesTransportationList',
                            data.Data ?? ''
                        );
                    }
                });
            } catch (e) {
                console.log('Action login: ' + e.message);
            }
        }
    }
};
