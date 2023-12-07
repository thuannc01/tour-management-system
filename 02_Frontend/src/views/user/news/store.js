import repository from './repository';

const initData = {
    //
};
const conditions = {
    title: '',
    type: '',
    sort: 'DESC',
    page_size: 4,
    page_number: 1
};

export default {
    namespaced: true,
    state: {
        data: { ...initData },
        newsTypeList: [
            { code: '', name: 'Tất cả' },
            { code: 'Cẩm nang', name: 'Cẩm nang' },
            { code: 'Tin tức', name: 'Tin tức' }
        ],
        sortList: [
            { code: 'DESC', name: 'Mới nhất' },
            { code: '', name: 'Cũ nhất' }
        ],
        pageSizeList: [
            { id: '6', name: 'Hiển thị 6' },
            { id: '9', name: 'Hiển thị 9' },
            { id: '12', name: 'Hiển thị 12' }
        ],
        conditions: { ...conditions },
        totalRows: 1,
        dataTable: [],
        imgNews: [
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960406/news/news11_dx2p8c.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960406/news/news16_vhbamx.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960406/news/news15_soocr9.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960406/news/news2_iopq3y.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960406/news/news14_qgak04.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960405/news/news10_abgbxz.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960405/news/news13_fjpnkz.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960405/news/news12_hllk7y.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960404/news/news9_c8eo3n.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960404/news/news8_d51hjv.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960404/news/news3_jsmlsr.png',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960404/news/news7_cdyzb8.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960403/news/news6_hhh0sh.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960403/news/news1_l8asdq.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960403/news/news4_riiykp.jpg',
            'https://res.cloudinary.com/dih79o7tn/image/upload/v1701960402/news/news5_qnesyr.jpg'
        ]
    },
    mutations: {
        setDataTable(state, data) {
            state.dataTable = [];
            state.dataTable = data;
        },
        setTotalRows(state, data) {
            state.totalRows = data;
        }
    },
    actions: {
        searchNews(context, conditions) {
            try {
                repository.searchNews(conditions).then((res) => {
                    const { data } = res;
                    if (data.Code == 200) {
                        context.commit('setDataTable', data.Data.dataSearch);
                        context.commit('setTotalRows', data.Data.totalRows);
                    }
                });
            } catch (e) {
                console.log('' + e.message);
            }
        }
    }
};
