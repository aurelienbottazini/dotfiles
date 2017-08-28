import { createVM, destroyVM } from '~test/unit/specs/utils';
import ${1:`(file-name-nondirectory (car (split-string (buffer-file-name) ".spec.js")))`} from '~src${2:`(cadr (split-string (file-name-directory (buffer-file-name)) "/packages"))`$1}.vue';

$0

describe('$1', () => {
  let vm;

  afterEach(() => {
    destroyVM(vm);
  });

  function getRootElement() {
    return vm.$el;
  }

  describe('without Props', () => {
    it('renders', () => {
      vm = createVM({
        template: \`
<$1>
</$1>
        \`,
        components: { $1 },
      });

      expect(getRootElement()).to.not.be.null;
    });
  });
});
