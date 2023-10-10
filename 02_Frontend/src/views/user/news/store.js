// import repository from './repository';

const initData = {
    newsType: '1',
    sort: '1'
};
export default {
    namespaced: true,
    state: {
        data: { ...initData },
        newsTypeList: [
            { code: '1', name: 'Tất cả' },
            { code: '2', name: 'Cẩm nang' },
            { code: '3', name: 'Tin tức' }
        ],
        sortList: [
            { code: '1', name: 'Mới nhất' },
            { code: '2', name: 'Cũ nhất' }
        ]
    },
    mutations: {},
    actions: {}
};
