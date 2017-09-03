import { createVM, destroyVM } from '~test/unit/specs/utils';
import ${1:`(file-name-nondirectory (car (split-string (buffer-file-name) ".spec.js")))`} from '~src/packages${2:`(cadr (split-string (file-name-directory (buffer-file-name)) "/packages"))`$1}.vue';

describe('$1', () => {

  it('is defined', () => {
    expect($1).to.be.an('object');
  });

  describe('rendered component', () => {
    let vm;

    afterEach(() => {
      destroyVM(vm);
    });

    function get$1() {
      return vm.$el;
    }

    function create$1(template) {
      return createVM({
        template,
        components: { $1 },
      });
    }

    it('renders', () => {
      vm = create$1('<$1></$1>');
      expect(get$1()).to.be.defined;
    });
  });
});
