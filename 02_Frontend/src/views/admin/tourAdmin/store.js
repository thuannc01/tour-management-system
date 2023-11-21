import repository from './repository';

const initData = {
    title: '',
    category_id: { name: '', code: '' },
    tourist_segment_id: { name: '', code: '' },
    type_transportation_id: 1,
    from_province_id: '1',
    to_province_id: '33',
    number_of_day: '',
    adult_ticket_price: '',
    child_ticket_price: '',
    infant_ticket_price: '',
    additional_services_id: { name: '', code: '' },
    images: [],
    itinerary_highlight: '',
    policy: '',
    note: ''
};

const tourDateData = {
    tour_id: '',
    day: '',
    title: '',
    food_spot_id: { name: '', code: '' },
    hotel_spot_id: { name: '', code: '' },
    body: ''
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
        initScreen(state) {
            state.tourData = { ...initData };
            state.tourDateData = { ...tourDateData };
        },
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
            state.tourDateData.food_spot_id.name = data[0].name;
            state.tourDateData.food_spot_id.code = data[0].id;
        },
        setHotelSpotsList(state, data) {
            state.dataList.hotelSpotsList = data;
            state.tourDateData.hotel_spot_id.name = data[0].name;
            state.tourDateData.hotel_spot_id.code = data[0].id;
        },
        setAdditionalService(state, data) {
            state.dataList.additionalServicesList = data;
            state.tourData.additional_services_id.name = data[0].name;
            state.tourData.additional_services_id.code = data[0].id;
        },
        setImagesTourList(state, data) {
            state.tourData.images = data;
        },
        setInitImagesTourList(state) {
            state.tourData.images = [];
        },
        deleteImagesTourList(state, data) {
            const indexOfObject = state.tourData.images.findIndex((object) => {
                return object.public_id == data;
            });
            state.tourData.images.splice(indexOfObject, 1);
        }
    },
    actions: {
        getAllCategories(context) {
            try {
                repository.getAllCategories().then((res) => {
                    const { data } = res;
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
        },
        getAllLocation(context) {
            try {
                repository.getAllLocation().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setLocationList', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('Action login: ' + e.message);
            }
        },
        getAllFoodSpots(context) {
            try {
                repository.getAllFoodSpots().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setFoodSpotsList', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('Action login: ' + e.message);
            }
        },
        getAllHotelSpots(context) {
            try {
                repository.getAllHotelSpots().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setHotelSpotsList', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('Action login: ' + e.message);
            }
        },
        getAllAdditionalService(context) {
            try {
                repository.getAllAdditionalService().then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setAdditionalService', data.Data ?? '');
                    }
                });
            } catch (e) {
                console.log('Action login: ' + e.message);
            }
        }
    }
};
