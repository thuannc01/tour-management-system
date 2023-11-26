// import repository from './repository';

const initData = {
    test: '',
    selectedOption: '2'
};
export default {
    namespaced: true,
    state: {
        data: { ...initData },
        selectOptions: [
            { code: '1', name: 'Option 1' },
            { code: '2', name: 'Option 2' },
            { code: '3', name: 'Option 3' }
        ]
    },
    mutations: {},
    actions: {}
};
