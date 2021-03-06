#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --version         print cmake installer version
  --prefix=dir      directory in which to install
  --include-subdir  include the Tutorial-1.0-Darwin subdirectory
  --exclude-subdir  exclude the Tutorial-1.0-Darwin subdirectory
  --skip-license    accept license
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "Tutorial Installer Version: 1.0, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
This is the open source License.txt file introduced in
CMake/Tutorial/Step7...

____cpack__here_doc____
    echo
    while true
      do
        echo "Do you accept the license? [yn]: "
        read line leftover
        case ${line} in
          y* | Y*)
            cpack_license_accepted=TRUE
            break;;
          n* | N* | q* | Q* | e* | E*)
            echo "License not accepted. Exiting ..."
            exit 1;;
        esac
      done
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the Tutorial will be installed in:"
    echo "  \"${toplevel}/Tutorial-1.0-Darwin\""
    echo "Do you want to include the subdirectory Tutorial-1.0-Darwin?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/Tutorial-1.0-Darwin"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

extractor="pax -r"
command -v pax > /dev/null 2> /dev/null || extractor="tar xf -"

tail $use_new_tail_syntax +152 "$0" | gunzip | (cd "${toplevel}" && ${extractor}) || cpack_echo_exit "Problem unpacking the Tutorial-1.0-Darwin"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;
� Ƿ+` �=��u#ݟ|w�d~M��blc˖��g�A`���9|>������|Ju��������DMi�4���u�4߅���=�nC�q�|���v��r��\>��f�J����?Ң����ͼy�f������.p3���p8�46J6	�k���lp8���oql� �t8��8߂a�Gc�����"t@��[$�ڑ��GB���x,�{�UG��o��Po����z&9�K m�����_��^c�2���X
ǺJ�'������C��n�����[ry��P�0#������)ol�+訢dY��bY2#��K�/\��˵|�YB��r4������ߗ�,įR�O��¾H~�(�n.*���n�7���䘷���u�����3Y��"����Mm����`��B�hL����6~�/+*_<x�?�#����<���/�^Իc�ώ��(o�ew���q���T(��DI0!��䧶qm;Q?>d�K���d�r��˥�Y�^9z��+�ñHA~�\+^WW����y����įO��/C��-;w�r�ة�e�S���������*��� � �D9 ��ԭ�E �P��D�,C��b�-,3v��XM�*���Ep�I�
�{kΓ���P��x4�9����s �C��I������p١���~��7?VG對��j~`��M�F��U����3m�zT�	�#e�5#��\�ɹ	��wq�f���Ta�o?���7�DExXK��&�}=�ؿ�P
�P
�P
�P
�P
�P
�P
�P
:<ɟz��y��.�Ƀ�d|���	���A�gpۢ���=��GC<y�s��Х�)�=�Ob��d��ż�:߁�LƗ�P9`�l�Z�h�G.�L���0R�B5N,�ڈ�z3�ȣN 2�;�m���x��G�,�>��.�:�>��g��qe	�˺�=4���=8�|�"L���0]�����]�LP�������?�VAц/Re�K�S��ļ�3yOa�e\N�s���`g�/��w�>Kt��9�B���I�(�l���|X;>��FH&<���Ƀ
ol<��~!
�`<�I>�,C9� ����M*/�J��Ϧ�w�cHmwǺR_����3�S��@�8�w5��g�x���S��aQ=��N�$GZY�1�+��،�Q���l�,�|}��Iv`3'��)ˠ.uH�)�C~��Ox���q��0�p��EN*��92nlv�qe9�&�Or��'�<4!Y/Uլ��}l̢& �P^���
 `]����<��Mʓl=�'�se ��O�?^H>x���a=u$;�S��Hˠ;�\��'���<G�9#ʯ�[���2i�u��w�i�2ꩱ}BG�/�ٲqރ//��*�h�z��F%ς}P���R⥤�R���ct�w��q��BT䯜PK��U.]������;�� eVzS:}]Q>�T����OI���Z?6Y�~N�B�?)�?0Vq�P��s- ֎#�g=��3�����;��}z@�?�;�}�̻�$��\��>v�(٭'=��'�f�v�̈́� �e*f��E���<���	d|�{���Ţ�8�ʳɤ�ڡ�'���xf���T�Y��9/���Y��Nx���Zy�'w�ؔ���ݜ_��s��>��#�i�>�^.4&���4�1�a+$~��sGh�)!+^=G�X�V|̟z޳�}��}2d*�'R�9G�/��9o�[H�u��2ŕrS�_,�kM���o>�^^x>"}tY��;���t�+;������x�-�\�˩ݧ$�����i�c<�h��;xc�S�$GI&�~�ujf�ǟS/�y��s��T�6�7զXP�d�j�pE�t�]�
�O$���{�-P��[;�] e�?�����o*��o��O���4��l����$�	޳�Aj�A��3?��a��)��`��`�˗��D��;?���9>��V\�Q�ӊ��k��<��T���o��߮�-�ʭ�b�2ό�N~���g��jG�+@���Hc������j����<�������	kL\�	f���?~���j�_�kv�m���_]&�	nӌNB3�������w.�C���P��Va�T'z.�ΐ
�!�`�ǡ�r׻���?��i]��H|7��U�u�|��I�/���y���!VUn�u�*{ѝ�]4�o��R�⶟����HP��J����H��v��Ɏ�N�+���"����i��@-�	q�ɒ��뛐�	�  j���=͢n>����G�i�)3���ϖ��#�Ɨ�����S1y��E�G,�E�6�:��Ԡ��>ƭ�5�k��!�� �ԉ�&�pT$�9l��V�ǀ�����L���q�l�V�7]���U.��[�KqK�/�T��H{{9�Q�*��v���=t�j�ѯ	a��"D����b��������E	m �><��(�9L�$7������gx;��#(^�Jl�����J��S�w{�f;ve&��R�K�A�k�FLI�kc�唼�06!.�"���n���╚�P�r���d��|��9\��y�a}�ي��;j}�<̙�>��V���AYi=�[����ܯG��/�b�[_\n*��`&Z_�.˷���\���� �|}q SM���ԅ��_�Y~~��?�����	~�?��������I~�S~>��_������y�������4?���o���|��G�����-GW<��ϯ�o�S}���ؿ�ݶo;�~�1�hv�{��cg0V�O2Na�6�����a��Ɔ0v�b���>�}c�c�!���>��[�����	c={cw`�O0ֆ�oc�f�}c�c2V��71m�������7-e?�~dZ����n�����������3�����5��e3\ƃe���eNƾ[V��2�h�j�'���c �cf�f��wT^�M�j=&S���A��+;������|��?��&����]ˤ`���a{�|R�޸7�"�PL
�JL�G%��I1Ȍy�pI������H^8�A��H�yq���c��~�!&P��'�l�A�ծ'��ᛄ�o@��~;	b�Y�2��"z��!��`��]�f☎�h�/c�|c�06t�b������N�#��켆��&�]h-��1&|�4du�a�h�0��Sg3����e�a�T�_�Lm�R_�L��Y)�B)�B)�B)�B)�B)�B)�B)|��K���eW]%�8��r7R~A���K��}# ��?>Bx�����U�e~���'�*��}*v�o8�ʵ_}b���\���M�u���#�1�o&�͖�4=v���ʪ��*\/��)_�t	2�k��]
�P
�P
�P
�P
�P
�P
�𾄥W�N���R�,߱�=V/�Ά�P<�f�FXJ���;���v��{�<G�?0 �}�h(��c��,u��_	+x]�`�� #�����c�?~N��^��������[��RE��}�^�}�IS���s������5�r8�����E��޸/����.�@؃��]ި�[Ec���^y�Cv�۷�m���~��h+	DwN�W�^��$��	)Ţ�`�!l���E��>迨E��.QCS ����ƣ>����!k�,�Em:�f(*C�����ĮcQ�v��uB(a0W@�Vo +��"�=M����`'�#��c�ߍ]�g��)��ѱ2�A��Eqs9ڦ_��7����o�~�/���t�i���I猙�]�7}�����gTԏE&����z�{va�������W�Ԇ�t���,�A�����p}��J?�Pr�닄���/���y#�!�qA��
sH�?��x�a�.wx�.�~Pɻ�0�d6Ǉ5��#&���}� �g�.���O���dV��dvy��d����^�΍�hf��>�7���|r�ϋsm�l~�V�F�(5��7���=�93+����i�f��ƒ�sY��������џ2��2�1�]�Y,��F�XN,�a�,��x:<j*k�:�rI*wHa�a��b�Kr9$���%�l��$�&�h7K��,@�d��tecK��zn}7�i$�EϿ�$<E��핌]aJ����J�?�B��C8�DpA��%�o&<E��>L��*�?M���?N�ۄ�V
�i!y	���0�#��C�G	_���I���p��&<TM���#��#ᣄ�Cx��5$��<�	��$|�pO-�#���oXL�M�A�$\"� ��_!<Ex��¯"��Dp;�	�?���5�ӄ�p}�����������W�Z�>����ih�^�F����q�^�ڮ��O�j��]�ןѫ����j�ǱN�?����3�N�?#����I���X�ן��z��\�ן�z������m�^��ӹA�?�z�Im�������l��t�^\�����������m�^\�_b�<k7z��d��Z	o!��p��N�#��	?Lx��c�Wg��Ɋ��.�x"�q+��{�;W�?&T����8ͯ�M�˹�7�D}�]�#�I��&3&��	ܤ�	�e�_�ɬ�?a��2��e�7���^�E>j�l��z�c��1��7�e�_0��7���\߿�z|�G;�w�q7��4݁r�!3a{��%��,���ญ	���������yb���
���eǿr���0��Wb�n�,Ʀ�)�t?<�����`,˹�Z�/���׸I������xN��s���m�7�3���r�;���6�3���<5���n��o�w�3�����lt��ps�����;]u���pc�v3��=�Nii Q3��f}�mw��tg��]3������j�A��Ç���Bm�ԭTGW�W���q��6������wC��μl�W�m�Y����;��4���FR�VQH
T����e�#eS�����zv�:�Aa�1P|~)��op?(y  g.�����3̃�u�B�0�AT��(�z�56���D!:���u[лL8�F}=�����O��2Lwaw{���gKL�n���Wmu�j��˩M�|������p�t9xoN�B=��Ӎ9�y-8A�Br�{����ٹx���{����	Ea���6L3b��WQ9
�n�f! �K)�[�h_(R��󤸍��H4��k�ն��We6P�UF01���Lb�N흫e���E��Z��D3���M��6魤1���{4;��ɜ�#̽��n�ޒ���d�������QZ3����R3��t�Y&}d�v����ϑ�Ҙ�Ҝ�R�KԐ˩�!7i+��µh8�o���v�=�y�:��[�K�?"������v���9��7y�it���Pd��b�[�`���4��.D�	��h�x ������U�߂���W} o{���v����s:���Y�T�����wa����tR7�x��#����M'�jM%E��PDRU���_�?��$ȷ�|�-���?z��Y�`�n pd:��r���zJ������|�1���������r��_�y綎��}}��8���NGi�_�p���Hw߇��rn�sH��lr�7l���q�����c)564eg�,oj�׺�}��~˞�n4e�}>c�3�����'	�E��$��~�����Ƽ5?^��&��/�>$���B~�jj�ڜ_���u��_b�7ul
�������3�>���~E"�|��=P�1|39c_V�ǫ4Z5�q�n�G�����CY�V0�~i Ih�d9�!М�_��P3؄U���k]��wwkf�ȷX� ��l��m�����������
"�
fp�|g��:_��N�Y����3\r\|�!����ۖ�p�R��$���e_��������v��J��h��R�]���'���u�����b�0�Cc��P}t����t�-����T�t���mТ��?_k���Ux�6���v�y1���/�i�ۯ���ۧ�kkgdo��ڌ<do?+�i�}^�Ӷ�?�?3^��U��ןU���S\��H��E��!M�%F&�O&�+�s��?�r��Ʉ:�O�iS�O�驢��H�����O��Edy��q"����Zt��0��2R���?��y�O�Ige�����d��Bj5m�d|@�����3K�d��I�2���Ʉ�M�?YV�f��C�+��Cw���pN��#_�?�P���<���@H���6�x�ş{ b��@�$ߔ��d��Pk���W&�����46�D����2e <c�@D/���3�@���Ќ���U�H��?�I���t ��_�dB����?������g��?DԐ3��?$[ӆ��җEn�;��s���/ڐi�r˟?B)+
�)e_�|��.r�Oh�����K
�'(�B����}�UʏR���㔿��|U��OP���#�A��4�o.�o���@����?L�k�Q�����B��3 8�G�k
�G�W�OQ~u��!�_R ���ȷ���m���@~�������o���?J���|����wc�맅��Κ��%(�����o�F'Fn�(���"���y�B�Q���Ô_h|."h��f��l�U��I\ϸ3K�~��Z��%�G��Ӵ����7�M�0F�߂nE��� ~���=�c\�-/B�����%E�j�����UE�p3OtK��ݥ᷿��@w��ہ�D���?�1���ݻ@�"��E�V���6�k��)�_���"t_�a����@wf
��:�k#:g���@��nM��.MtW����.B�鲬|K�Н(��ߞ"t?��W_���D���F�'��E��j��4������l�ߗ�nt
�~t�ޞ\��asj{{��h�Yޞ\� nv�����@�Gt���=ta��X��5�x���]N���~'�B��̦�6�E��.�������=w�?E6�_�%Z�wY��D����rga�(�B��.?�Y�~�1{_-_���xc�ܵ�]��z���Zk������n�x�e��𵦽�&� ^	�������D5_+�?S��������%x%��E��������g ~�Ë��]�� ��z�f_�R��Z�a�Q_�����ߣ��Y���~+�:,|�b�X_�&��T��g�����*���~I7Ub���k�7��l +E��W���J����t��O~�B�?R��<�P�¾��ϖ���r�N���췕�m9_��sl9��2��
p�S&���GB��]e���H^�l��hTm�=3ok���L{��>Î��&��v�����B���L|�a�Iy�oz����mw��b"����s�^M���2�|/~��Ŷo�d|����L���\�v�<~���e*�J�6��=�JF0-�OT�+���-�{�%#�>D0A����`3�sP9������Q9Bp�`�`'AA� #�6Sy�C;	�J����"� �I�EP"HF:*'�h>�����#8D�ѥ�.A�]%����JN���j�����!;9��ծM�ed�����]u?o7=��d���/��i�|Z�SD�g��ȧ}�CT^ݏ����ޣڱ��nS9��!<L��~:A���G�U7:�U�\���U�Q�?����S�j���7�~u��)����7U;c��O����S�;F�9j���}��W��%\���b$�gU�I�?C����/)_ݏnWǇ��I�/u߹�����R�?u��L��������/LX��5��Bh'Hݏ�	\��`����Q��}
p���+��O��cD�>?k��aҗ8�_��^�g�o.�n���2=�����J=n���_1��`��`(�if�'d�{�q���We�ϐ��P����ņ���{��*�,l_���+�T�/��_�S��=�ߴgb���͇�͙�������B�~P;k��-4�Π���XX�k��Ň�ۓXp��#����l�qL!-��޳3CS��K^�QS�!0M;<�����U0�c�1�5?���3�6�~[�˱�3KCC��S�4��1]kvE^����{�b2�=sb�o
�Y�k�%���L�Lf6����٫�[{4sm�-��cҖ\�+�,��7X
�P
�P
�O=X �  