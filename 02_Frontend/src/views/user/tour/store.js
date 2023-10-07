// import repository from './repository';

const initData = {
    priceSelected: '1'
};
export default {
    namespaced: true,
    state: {
        data: { ...initData },
        priceOptions: [
            { code: '1', name: 'Tất cả' },
            { code: '2', name: 'Dưới 2tr' },
            { code: '3', name: 'Từ 2tr - 4tr' },
            { code: '4', name: 'Từ 4tr - 6tr' },
            { code: '5', name: 'Từ 6tr - 10tr' },
            { code: '6', name: 'Từ 10tr - 20tr' },
            { code: '7', name: 'Trên 20tr' }
        ]
    },
    mutations: {},
    actions: {}
};
