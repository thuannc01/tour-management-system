import repository from './repository';
import store from '@/store';
import { MSG_TYPE } from '@/utils/messages';

const initData = {
    id: '',
    title: '',
    category_id: [{ name: '', id: '' }],
    tourist_segment_id: [{ name: '', id: '' }],
    type_transportation_id: 1,
    from_province_id: '1',
    to_province_id: '33',
    number_of_day: '',
    adult_ticket_price: '',
    child_ticket_price: '',
    infant_ticket_price: '',
    additional_services_id: [{ name: '', id: '' }],
    images: [],
    itinerary_highlight: '',
    policy: '',
    note: ''
};

const tourDateData = {
    tour_id: '',
    day: '',
    title: '',
    food_spot_id: [{ name: '', id: '' }],
    hotel_spot_id: [{ name: '', id: '' }],
    body: ''
};

const searchConditionInit = {
    title: '',
    departure_time: '',
    arrival_time: '',
    adult_ticket_price: '',
    page_size: 4,
    page_number: 1,
    mode: 0
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
        },
        tourDateDataTemp: [],
        dataTable: [],
        conditionSearch: { ...searchConditionInit },
        totalRows: 1
    },
    mutations: {
        initScreen(state) {
            state.tourData = { ...initData };
            state.tourDateData = { ...tourDateData };
            state.tourDateDataTemp = [];
        },
        initTourDateData(state) {
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
            state.tourData.category_id[0].name = data[0].name;
            state.tourData.category_id[0].id = data[0].id;
        },
        setTouristSegmentsList(state, data) {
            state.dataList.touristSegmentsList = data;
            state.tourData.tourist_segment_id[0].name = data[0].name;
            state.tourData.tourist_segment_id[0].id = data[0].id;
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
            state.tourDateData.food_spot_id[0].name = data[0].name;
            state.tourDateData.food_spot_id[0].id = data[0].id;
        },
        setHotelSpotsList(state, data) {
            state.dataList.hotelSpotsList = data;
            state.tourDateData.hotel_spot_id[0].name = data[0].name;
            state.tourDateData.hotel_spot_id[0].id = data[0].id;
        },
        setAdditionalService(state, data) {
            state.dataList.additionalServicesList = data;
            state.tourData.additional_services_id[0].name = data[0].name;
            state.tourData.additional_services_id[0].id = data[0].id;
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
        },
        //
        setTourDateDataTemp(state, data) {
            state.tourDateDataTemp.push(data);
        },
        initTourDateDataTemp(state) {
            state.tourDateDataTemp = [];
        },
        deleteTourDateDataTemp(state, data) {
            const indexOfObject = state.tourDateDataTemp.findIndex((object) => {
                return object.day == data;
            });
            state.tourDateDataTemp.splice(indexOfObject, 1);
        },
        // set data search
        setTotalRows(state, data) {
            state.totalRows = data;
        },
        setDataTable(state, data) {
            state.dataTable = [];
            state.dataTable = data;
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
                console.log('' + e.message);
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
                console.log('' + e.message);
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
                console.log('' + e.message);
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
                console.log('' + e.message);
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
                console.log('' + e.message);
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
                console.log('' + e.message);
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
                console.log('' + e.message);
            }
        },
        saveTour(context, conditions) {
            try {
                repository.saveTour(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        store.commit('app/showModalMessage', {
                            type: MSG_TYPE.SUCCESS,
                            title: 'Lưu tour thành công',
                            content:
                                'Dữ liệu tour du lịch đã được cập nhật vào cơ sở dữ liệu',
                            okText: 'Tiếp tục',
                            callback: (ok) => {
                                if (ok) {
                                    setTimeout(function () {
                                        document
                                            .getElementById('btn-btnUpdate')
                                            .click();
                                    }, 300);
                                    setTimeout(function () {
                                        document
                                            .getElementById('btn-btnList')
                                            .click();
                                        context.dispatch('searchTour');
                                    }, 400);
                                }
                            }
                        });
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        searchTour(context, conditions) {
            try {
                repository.searchTour(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit(
                            'setTotalRows',
                            data.Data.totalRows ?? 1
                        );
                        console.log('setDataTable: ', data.Data.dataSearch);
                        context.commit(
                            'setDataTable',
                            data.Data.dataSearch ?? ''
                        );
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        },
        deleteTour(context, tourID) {
            try {
                repository.deleteTour(tourID).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.dispatch('searchTour');
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
