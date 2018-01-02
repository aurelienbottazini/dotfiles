import { shallow } from 'vue-test-utils';
import ${1:`(file-name-nondirectory (car (split-string (buffer-file-name) ".spec.js")))`} from '../${2:`(cadr (split-string (file-name-directory (buffer-file-name)) "/packages"))`$1}.vue';

describe('$1', () => {
  it('renders', () => {
    expect(shallow($1).isVueInstance()).to.be.true;
  });
});
