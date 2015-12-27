<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Nhanvien;

/**
 * NhanvienSearch represents the model behind the search form about `app\models\Nhanvien`.
 */
class NhanvienSearch extends Nhanvien
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'maKhoa'], 'integer'],
            [['chucVu', 'queQuan', 'danToc','tenNV'], 'safe'],
            [['gioiTinh'], 'boolean'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Nhanvien::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'maKhoa' => $this->maKhoa,
            'gioiTinh' => $this->gioiTinh,
        ]);

        $query->andFilterWhere(['like', 'chucVu', $this->chucVu])
            ->andFilterWhere(['like', 'queQuan', $this->queQuan])
            ->andFilterWhere(['like', 'danToc', $this->danToc]);

        return $dataProvider;
    }
}
