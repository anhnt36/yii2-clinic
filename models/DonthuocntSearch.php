<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Donthuocnt;

/**
 * DonthuocntSearch represents the model behind the search form about `app\models\Donthuocnt`.
 */
class DonthuocntSearch extends Donthuocnt
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'maNT', 'ngayKeDon'], 'integer'],
            [['donthuoc', 'cachSD'], 'safe'],
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
        $query = Donthuocnt::find();

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
            'maNT' => $this->maNT,
            'ngayKeDon' => $this->ngayKeDon,
        ]);

        $query->andFilterWhere(['like', 'donthuoc', $this->donthuoc])
            ->andFilterWhere(['like', 'cachSD', $this->cachSD]);

        return $dataProvider;
    }
}
